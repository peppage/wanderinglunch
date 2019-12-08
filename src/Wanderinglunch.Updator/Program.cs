using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Rollbar;
using Serilog;
using System;
using System.IO;
using System.Threading.Tasks;
using Wanderinglunch.Data;
using Wanderinglunch.Updator.Services;

namespace Wanderinglunch.Updator
{
    class Program
    {
        public static void Main(string[] args)
        {
            try
            {
                MainAsync().GetAwaiter().GetResult();
            }
            finally
            {
                Log.CloseAndFlush();
            }
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
            var configuration = new ConfigurationBuilder()
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

            Log.Logger = new LoggerConfiguration()
            .ReadFrom.Configuration(configuration)
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
