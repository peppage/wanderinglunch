using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Sentry;
using Serilog;
using Serilog.Events;
using System;
using System.IO;
using System.Threading.Tasks;
using Wanderinglunch.Data;
using Wanderinglunch.Updator.Services;

namespace Wanderinglunch.Updator
{
    internal class Program
    {
        public static void Main(string[] args)
        {
            try
            {
                var serviceCollection = new ServiceCollection();
                ConfigureServices(serviceCollection);

                var serviceProvider = serviceCollection.BuildServiceProvider();

                serviceProvider.GetService<App>().Run();
            }
            finally
            {
                Log.CloseAndFlush();
            }
        }

        public static void ConfigureServices(IServiceCollection serviceCollection)
        {
            var configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetParent(AppContext.BaseDirectory).FullName)
                .AddJsonFile("appsettings.json", false)
                .Build();

            var dsn = configuration.GetSection("Sentry").GetValue<string>("Dsn");

            Log.Logger = new LoggerConfiguration()
                .Enrich.FromLogContext()
                .MinimumLevel.Debug()
                .WriteTo.Console()
                .WriteTo.Sentry(o =>
                {
                    o.MinimumBreadcrumbLevel = LogEventLevel.Debug;
                    o.MinimumEventLevel = LogEventLevel.Error;
                    o.Dsn = new Dsn(dsn);
                    o.AttachStacktrace = true;
                })
                .CreateLogger();

            serviceCollection.AddLogging(builder =>
            {
                builder.AddSerilog(dispose: true);
            });

            serviceCollection.AddSingleton<ILunchContext>(new LunchContext(configuration.GetConnectionString("Storage")));
            serviceCollection.AddSingleton<IUpdateService, UpdateService>();
            serviceCollection.AddSingleton<ITwitterService, TwitterService>();
            serviceCollection.AddSingleton<IConfigurationRoot>(configuration);
            serviceCollection.AddTransient<App>();
        }
    }
}