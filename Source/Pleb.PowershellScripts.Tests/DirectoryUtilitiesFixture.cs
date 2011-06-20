using System;
using System.Linq;
using NUnit.Framework;

namespace Pleb.PowershellScripts.Tests
{
    [TestFixture]
    public class DirectoryUtilitiesFixture
    {
        [TestFixtureSetUp]
        public void PerFixtureSetUp()
        {

        }

        [TestFixtureTearDown]
        public void PerFixtureTearDown()
        {

        }

        [SetUp]
        public void PerTestSetUp()
        {

        }

        [TearDown]
        public void PerTestTearDown()
        {

        }

        [Test]
        public void RunRemoveDirectoriesWhereSame()
        {
            //TODO: Make a better unit test for this.
            //DirectoryUtilities.RemoveDirectoriesWithSameName(@"F:\Open Source\Chillow\Lib", @"F:\Aid\Aid.Core\Lib");
        }

        [Test]
        public void RunCopyDirectory()
        {
            //TODO: Make a better unit test for this.
            //DirectoryUtilities.CopyDirectory(@"F:\Open Source\Chillow\Lib", @"F:\Aid\Aid.Core\Lib");
        }
    }
}