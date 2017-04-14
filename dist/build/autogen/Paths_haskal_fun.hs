{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_haskal_fun (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/chrisalbert/Library/Haskell/bin"
libdir     = "/Users/chrisalbert/Library/Haskell/ghc-8.0.2-x86_64/lib/haskal-fun-1.0"
datadir    = "/Users/chrisalbert/Library/Haskell/share/ghc-8.0.2-x86_64/haskal-fun-1.0"
libexecdir = "/Users/chrisalbert/Library/Haskell/libexec"
sysconfdir = "/Users/chrisalbert/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "haskal_fun_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "haskal_fun_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "haskal_fun_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "haskal_fun_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "haskal_fun_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
