# Regimentle

A daily regimen you score like Wordle. Mark each activity done or not, then copy a share text with your tiles, today's score, streaks and career success rate.

The website is `site/index.html` and `site/config.js`. `setup.sql` sets up the database. Sign-in and saving use Supabase, which is free at this size. Netlify publishes the `site/` folder on every push to `main` (see `netlify.toml`).

## Launch it

1. **Create the database.** Sign up at supabase.com and create a new project. Open *SQL Editor*, paste in all of `setup.sql`, and click *Run*.
2. **Connect the site to it.** In your Supabase project, click *Connect* at the top of the page, or go to *Project Settings > Data API* for the Project URL and *Project Settings > API Keys* for the key. Copy the *Project URL* (`https://<something>.supabase.co`) and the *anon public* key (a long string starting with `eyJ`, on the *Legacy API keys* tab) into `site/config.js`.
3. **Put the site online.** In Netlify, choose *Add new site > Import an existing project > GitHub* and pick this repository. The settings come from `netlify.toml`, so leave the build command empty. Netlify gives you a public address such as `regimentle-xyz.netlify.app`. You can rename it under *Site configuration > Change site name*. For a site that already exists, use *Site configuration > Build & deploy > Link repository* instead.
4. **Let sign-in links come back to your site.** In Supabase, open *Authentication > URL Configuration*. Set *Site URL* to your Netlify address, and add the same address under *Redirect URLs*.

Now open your site, sign in with your email, and share the link.

## Google sign-in

1. Go to console.cloud.google.com and create a project. Open *APIs & Services > OAuth consent screen*, choose *External*, and fill in the app name (Regimentle) and your email.
2. Open *APIs & Services > Credentials > Create credentials > OAuth client ID*. Choose *Web application*.
   - Under *Authorized JavaScript origins*, add your Netlify address.
   - Under *Authorized redirect URIs*, add `https://wylmwyfqmdnrnxcwhtpk.supabase.co/auth/v1/callback`.
3. Copy the *Client ID* and *Client secret*. In Supabase, open *Authentication > Sign In / Providers > Google*, turn it on, paste both, and save.
4. Back in Google, publish the consent screen (*Audience > Publish app*) so people other than test users can sign in.

## Good to know

- Sign-in is Google only. To make sure nobody can create an account by email, turn off *Authentication > Sign In / Providers > Email* in Supabase.
- Anyone can use the site without signing in. Their progress is saved in their browser, and it moves to their account the first time they sign in.
