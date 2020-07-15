# Custom-Client-LESS-Files
This is a list of custom client LESS files so the client team can access them

## NOTE: This list might get out of sync with what's actually uploaded to the S3 bucket.
To ensure this list is up-to-date you can run the update.sh script to pull all client files down.

Likewise, any changes here will NOT automatically update the S3 bucket—meaning they will not be live for the client! You'll need to manually post to the `/css` endpoint in order to upload the LESS file with any changes. In general, if you make a commit here with some changes, you should also post it to the endpoint. See the curl request below for an example:

```
curl --request POST 'https://watershedlrs.com/api/organizations/<org_id>/css' \
--header 'Authorization: Basic username:password' \
--form 'file=@/File/path/to/your/LESS/file/1391_rebrand_prod.less'
```
