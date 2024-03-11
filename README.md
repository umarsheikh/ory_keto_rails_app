# Ory Keto Rails Application

This app is created to play around with Ory/Keto. Currently, it implements Oauth2 Authorization, Displaying Permissions, and Displaying All Users Endpoints from Ory/Keto.

## 1 OAuth2 Authorization
### Get OAuth credentials from Ory:
-  In the [Ory Console](https://console.ory.sh/) goto **OAuth 2** tab
- Click **Create OAuth2 Client** button
- Then in the **Server App** section click on **Create** button
- Enter **Client Name**, in the **Redirect URIs** add callback URL to redirect user after authorization (e.g.  `http://localhost:3000/oauth/callback`). We can leave rest of the options as they are by default. Then click **Create Client** button at the bottom of the page.
- Copy and Save the **Secret** at a safe place because this cannot be retrieved after this. Now close the popup.
- It will display the **OAuth2 Clients** list. From this page we can get the **ID** of the client we just created.
### Set ENV variables:

-	`ORY_CLIENT_ID` (Oauth client ID we get in the above step)
-	`ORY_SECRET` (OAuth client secret we get in the above step)
-	`API_BASE_URL` (Under the **Project Settings** tab in Ory Console Copy the URL from **API endpoints**)
-	`ORY_API_KEY` (Under **Developers** tab in the Ory Console we can **Create new API key**)

### Run the application:
-	Run rails server. Goto home page of the application. And Navigate using the links provided on the page.

## 2 Check a permission
- First, you need to have some permissions inside [Ory Console](https://console.ory.sh/). If not, then create a few permissions there
-  On `http://localhost:3000/ory/check-permissions` we can verify a permission. The to **Check a permission** is also available on the home page of the application.

## 3 Display all permissions
-  Under **Permissions** tab in the Ory Console add some permissions rules.
-  Goto `http://localhost:3000/ory/permissions` or follow the **View permissions** hyperlink on the home page of this app.
-  The application will fetch and display the permissions rule from Ory.

## 4 Display all users(identities)
-  Goto `http://localhost:3000/ory/identities` or follow the **View all users (Identities)** hyperlink on the home page of this app.
