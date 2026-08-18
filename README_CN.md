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

Package 会解析所需的 Google Mobile Ads 与二进制依赖。请不要手动添加、嵌入或单独初始化 Google Mobile Ads。

## 公开仓库访问

当前仓库及其 GitHub Release asset 均可公开读取。宿主解析已批准的 Release 时无需 GitHub 仓库权限或认证信息。

## App 必要配置

在 App target 的 `Info.plist` 中增加 Jolibox 提供的 Google Mobile Ads 应用 ID，键名为 `GADApplicationIdentifier`。

应用启动时仅初始化一次 Jolibox 基础 SDK；基础 SDK 就绪后仅初始化一次广告 SDK。广告 API、场景配置和宿主接入方式以随 SDK 交付的接入文档为准。

## 版本管理

接入时请使用已批准的 Release 版本。已发布的 Release asset 不可替换；SDK 更新时请升级到新版本。

英文文档见 [README.md](README.md)。
