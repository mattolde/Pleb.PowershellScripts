using System;
using System.IO;
using System.Linq;

namespace Pleb.PowershellScripts
{
    public static class DirectoryUtilities
    {
        public static void DeleteFilesInDirectory(string pathToDirectory)
        {
            Directory.GetFiles(pathToDirectory).ToList().ForEach(File.Delete);
        }

        public static void RemoveDirectoriesWithSameName(string pathOfDirectories, string pathWithDirectoriesToRemove)
        {
            if (string.IsNullOrEmpty(pathOfDirectories) || !Directory.Exists(pathOfDirectories))
            {
                Log("Path of `{0}` does not exist", pathOfDirectories);
            }

            if (string.IsNullOrEmpty(pathWithDirectoriesToRemove) || !Directory.Exists(pathWithDirectoriesToRemove))
            {
                Log("Path of `{0}` does not exist", pathWithDirectoriesToRemove);
            }

            var directoriesToSearchFor = Directory.GetDirectories(pathOfDirectories).Select(x => Path.GetFileName(x).ToLowerInvariant());
            var directoriesToMatchAndRemove = Directory.GetDirectories(pathWithDirectoriesToRemove);

            foreach (var directory in directoriesToMatchAndRemove)
            {
                var directoryName = Path.GetFileName(directory).ToLowerInvariant();

                if (directoriesToSearchFor.Contains(directoryName))
                {
                    Log("Match on directory `{0}`. It will now be removed.", directory);

                    Directory.Delete(directory, true);
                }
            }
        }

        public static void CopyDirectory(string pathOfDirectoryToCopy, string pathToCopyTo)
        {
            if (string.IsNullOrEmpty(pathOfDirectoryToCopy) || !Directory.Exists(pathOfDirectoryToCopy))
            {
                Log("Path of `{0}` does not exist", pathOfDirectoryToCopy);
            }

            if (string.IsNullOrEmpty(pathToCopyTo) || !Directory.Exists(pathToCopyTo))
            {
                Log("Path of `{0}` does not exist", pathToCopyTo);
            }

            var filesToCopy = Directory.GetFiles(pathOfDirectoryToCopy);

            foreach (var file in filesToCopy)
            {
                if (!Directory.Exists(pathToCopyTo))
                {
                    Directory.CreateDirectory(pathToCopyTo);
                }

                Log("Coping file `{0}` to `{1}`", file, Path.Combine(pathToCopyTo, Path.GetFileName(file)));

                File.Copy(file, Path.Combine(pathToCopyTo, Path.GetFileName(file)));
            }

            var directoriesToCopy = Directory.GetDirectories(pathOfDirectoryToCopy);

            foreach (var directory in directoriesToCopy)
            {
                CopyDirectory(directory, Path.Combine(pathToCopyTo, Path.GetFileName(directory)));
            }
        }

        public static void Log(string format, params object[] objects)
        {
            Console.WriteLine(format, objects);
        }
    }
}
