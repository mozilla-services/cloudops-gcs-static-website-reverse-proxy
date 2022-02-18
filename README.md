# Intro
This is an Openresty reverse proxy for static websites hosted by GCS.

The main purpose of the reverse proxy is to remove the "x-goog-meta-" prefix
from headers returned by GCS. In addition to that, it also does a few things
including:

* remove a few "x-goog-" headers that are less useful to the clients.
* compress the GCS responses for a few file types (html, js, css and etc.).
* allow logging the request and response headers for troubleshooting purpose.
* ...

# Release Process

Take the following steps to release a new tag.

1. File a PR with your changes and make sure they work correctly.

2. Merge the PR to the main branch.

3. Locally, sync your main branch with the remote (i.e.
   `git checkout main && git pull`).

4. Make a tag and push it.
   * The tag should be in [semver](https://semver.org/) form.
   * Breaking changes should increase the major number.
   * Remember to push your tag.

   For example,
   ```
   semver=0.0.1
   git tag "${semver}"
   git push --tags
   ```

5. Build an image and push it to the repository. For example,
   ```
   semver=0.0.1
   docker build --platform linux/amd64 -t gcr.io/moz-fx-cloudops-images-global/openresty:gcs-website-reverse-proxy-"${semver}" .
   docker push gcr.io/moz-fx-cloudops-images-global/openresty:gcs-website-reverse-proxy-"${semver}"
   ```
Note:
  * The build and push process is not automated because as of this writing, the
    image is not frequently built and it's not worth the effort to set that up
    (e.g. we would need a service account with proper permissions and we also
    need to manage its key file and etc.).
  * The major versions don't have EOL at this point, i.e. they're maintained
    forever (it's really because we don't expect that many changes in this repo).
