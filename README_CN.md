# Jolibox iOS SDK

Jolibox iOS SDK 通过 Swift Package Manager 提供，支持 iOS 15 及以上版本。

## 接入

在 Xcode 中添加以下 Package：

```text
https://github.com/Jolibox-Developer/jolibox-ios-sdk.git
```

选择 `0.3.0` 版本，并将 `JoliboxSDKAll` 添加到 App target。在使用 SDK 的文件中导入：

```swift
import JoliboxSDKAll
```

Package 会解析所需的 Google Mobile Ads 与内部二进制依赖。请不要手动添加、嵌入或单独初始化 Google Mobile Ads。

## 私有仓库访问

当前仓库为私有仓库。每位需要解析该 Package 的开发者和 CI 账号，都必须拥有仓库及 GitHub Release asset 的读取权限，并使用该账号完成 Git/Xcode 认证；未认证的宿主无法下载该 Package。

## App 必要配置

在 App target 的 `Info.plist` 中增加 Jolibox 提供的 Google Mobile Ads 应用 ID，键名为 `GADApplicationIdentifier`。

应用启动时仅初始化一次 Jolibox 基础 SDK；基础 SDK 就绪后仅初始化一次广告 SDK。广告 API、场景配置和宿主接入方式以随 SDK 交付的接入文档为准。

## 发布完整性

每个 Package 版本均使用不可变的 GitHub Release asset 和 SHA-256 校验和。已发布的 asset 不得替换；SDK 更新必须发布新版本。

创建 Release 前，必须先将 release commit 推送到 `origin/main`，使用发布脚本校验四个 asset，再从该精确 commit 创建 GitHub Release。脚本会在本地 `HEAD` 与 `origin/main` 不一致时拒绝发布。

英文文档见 [README.md](README.md)。
