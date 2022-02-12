This is an Openresty reverse proxy for static websites hosted by GCS.

The proxy does the following:

* remove the "x-goog-meta-" prefix from headers returned by GCS.
* compress the GCS response for a few file types (html, js, css and etc.).
