# Run the dashboard as a private, local iPhone app

This turns the web dashboard into a real app installed on your iPhone. It runs
**entirely on the device** — the HTML/JS is bundled inside the app, and your
data is stored locally in the app. No public web page, no login, just you.

> **Two things to know first**
> 1. **Free Apple ID:** the app stops opening after **7 days** until you plug
>    into your Mac and press Run again. A paid Apple Developer account ($99/yr)
>    makes it last a year. There is no free way around the 7-day limit.
> 2. **Local = data lives only in the app.** If you delete the app, that data
>    is gone. (While online it can still sync to your own Supabase, but you
>    don't need that for the app to work.)

---

## One-time setup (about 10 minutes)

### 1. Create the project
1. Open **Xcode** → **File → New → Project…**
2. Choose **iOS** → **App** → **Next**.
3. Fill in:
   - **Product Name:** `RowDashboard`
   - **Interface:** **SwiftUI**
   - **Language:** **Swift**
4. **Next**, then save it somewhere easy like your Desktop. Xcode opens the project.

### 2. Drop in the two code files
Xcode already made two files: `RowDashboardApp.swift` and `ContentView.swift`.
Replace their contents with the versions in this folder:
- Open `ios/Sources/RowDashboardApp.swift` (this repo) → copy all → paste over
  Xcode's `RowDashboardApp.swift`.
- Open `ios/Sources/ContentView.swift` (this repo) → copy all → paste over
  Xcode's `ContentView.swift`.

### 3. Add the website (the important step)
1. In Finder, open this repo's `ios/` folder so you can see the **`Web`** folder.
2. **Drag the `Web` folder** into the Xcode left sidebar, dropping it onto the
   blue `RowDashboard` project icon.
3. In the dialog that appears:
   - ✅ **Copy items if needed**
   - ✅ **Create folder references**  ← **must be this, NOT "Create groups"**
   - ✅ Make sure **RowDashboard** is checked under "Add to targets"
   - Click **Finish**.
4. You should now see a **blue** `Web` folder in the sidebar. (Blue = folder
   reference = correct. If it's yellow, delete it and re-add choosing
   "Create folder references".)

### 4. Run it on your phone
1. Plug your iPhone into the Mac with a cable. Unlock it and tap **Trust** if asked.
2. At the top of Xcode, click the device dropdown and pick **your iPhone**.
3. Click **Signing & Capabilities** (select the `RowDashboard` target first):
   - **Team:** pick your Apple ID. If none listed, click **Add an Account…** and
     sign in with your normal Apple ID — a free account is fine.
4. Press the **▶ Run** button (top-left).
5. First time only: on the iPhone, go to **Settings → General → VPN & Device
   Management**, tap your Apple ID, and **Trust** it. Then open the app.

Done — the dashboard is now an app icon on your home screen.

---

## After you edit the dashboard later
The app has its **own copy** of the site inside `ios/Web`. When you change any
`.html`/`.js` file in the repo, run this from the repo root to refresh that copy:

```bash
./ios/sync-web.sh
```

Then press **Run** in Xcode again to reinstall the updated app.

---

## Troubleshooting
- **Blank / black screen:** the `Web` folder is probably a yellow *group*, not a
  blue *folder reference*. Delete it in Xcode and re-add it choosing
  **Create folder references**.
- **"Untrusted Developer":** do step 4.5 above (Settings → VPN & Device Management).
- **App won't open after a week:** that's the 7-day free-account limit — plug in
  and press Run again, or get a paid Apple Developer account.
