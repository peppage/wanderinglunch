using FakeItEasy;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Tweetinvi.Models;
using Wanderinglunch.Logic.Extensions;

namespace tests.Wanderinglunch.Logic
{
    [TestClass]
    public class ExtensionsTests
    {
        [TestMethod]
        public void GetEpoch()
        {
            var date = new DateTime(2017, 7, 21, 7, 00, 0, DateTimeKind.Utc);
            var epoch = date.GetEpochSeconds();

            Assert.AreEqual(1500620400, epoch);
        }

        [TestMethod]
        public void NewTweet()
        {
            var tweet = A.Fake<ITweet>();
            A.CallTo(() => tweet.CreatedAt).Returns(DateTime.Now);

            Assert.IsTrue(tweet.IsEightHoursOld());
        }

        [TestMethod]
        public void OldTweet()
        {
            var tweet = A.Fake<ITweet>();
            A.CallTo(() => tweet.CreatedAt).Returns(DateTime.Now.AddDays(-1));

            Assert.IsFalse(tweet.IsEightHoursOld());
        }

        [TestMethod]
        public void TweetToUser()
        {
            var tweet = A.Fake<ITweet>();
            A.CallTo(() => tweet.FullText).Returns("@you this is a test");

            Assert.IsTrue(tweet.ToUser());
        }

        [TestMethod]
        public void TweetNotToUser()
        {
            var tweet = A.Fake<ITweet>();
            A.CallTo(() => tweet.FullText).Returns("general tweet");

            Assert.IsFalse(tweet.ToUser());
        }

    }
}
