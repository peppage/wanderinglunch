using System;
using System.IO;
using System.Threading.Tasks;
using Serilog;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Wanderinglunch.Data;
using Wanderinglunch.Updator.Services;
using Rollbar;

namespace Wanderinglunch.Updator
{
    class Program
    {
        public static IConfigurationRoot configuration;

        public static void Main(string[] args)
        {
            MainAsync().GetAwaiter().GetResult();
        }

        private static async Task MainAsync()
        {
            var serviceCollection = new ServiceCollection();
            ConfigureServices(serviceCollection);

            var serviceProvider = serviceCollection.BuildServiceProvider();

            await serviceProvider.GetService<App>().Run();
        }

        public static void ConfigureServices(IServiceCollection serviceCollection)
        {
            configuration = new ConfigurationBuilder()
                .SetBasePath(Directory.GetParent(AppContext.BaseDirectory).FullName)
                .AddJsonFile("appsettings.json", false)
                .Build();

            var rollbarConfig = configuration.GetSection("Rollbar");
            var rollbarAccessToken = rollbarConfig.GetValue<string>("AccessToken");
            var rollbarEnv = rollbarConfig.GetValue<string>("Environment");

            RollbarLocator.RollbarInstance.Configure(new RollbarConfig(rollbarAccessToken)
            {
                Environment = rollbarEnv
            });

            serviceCollection.AddSingleton<ILunchContext>(new LunchContext(configuration.GetConnectionString("Storage")));
            serviceCollection.AddSingleton<IUpdateService, UpdateService>();
            serviceCollection.AddSingleton<ITwitterService, TwitterService>();
            serviceCollection.AddSingleton<IConfigurationRoot>(configuration);

            serviceCollection.AddSingleton(new LoggerFactory()
                .AddConsole()
                .AddSerilog()
                .AddDebug());
            serviceCollection.AddLogging();

            Log.Logger = new LoggerConfiguration()
                .WriteTo.Console(Serilog.Events.LogEventLevel.Debug)
                .MinimumLevel.Debug()
                .Enrich.FromLogContext()
                .CreateLogger();

            serviceCollection.AddLogging(configure =>
            {
                configure.SetMinimumLevel(LogLevel.Debug);
                configure.AddConsole();
            }).AddSingleton<App>();

            serviceCollection.AddTransient<App>();
        }
    }
}
