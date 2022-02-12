This is an Openresty reverse proxy for static websites hosted by GCS.

The main purpose of the reverse proxy is to remove the "x-goog-meta-" prefix
from headers returned by GCS. In addition to that, it also does a few things
including:

* remove a few "x-goog-" headers that are less useful to the clients.
* compress the GCS responses for a few file types (html, js, css and etc.).
* allow logging the request and response headers for troubleshooting purpose.
* ...
