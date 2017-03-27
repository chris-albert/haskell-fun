
import Network.HTTP

main = simpleHTTP (getRequest "http://www.haskell.org/") >>= fmap (take 100) . getResponseBody