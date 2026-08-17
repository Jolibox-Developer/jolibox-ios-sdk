# Jolibox iOS SDK

Jolibox iOS SDK is delivered through Swift Package Manager. It supports iOS 15 and later.

## Install

In Xcode, add the package dependency using:

```text
https://github.com/Jolibox-Developer/jolibox-ios-sdk.git
```

Select the `0.3.0` release and add `JoliboxSDKAll` to the app target. Import it where the SDK is used:

```swift
import JoliboxSDKAll
```

The package resolves the required Google Mobile Ads and internal binary dependencies. Do not manually add, embed, or initialize Google Mobile Ads separately.

## Required App Configuration

Add the Google Mobile Ads application identifier supplied by Jolibox to the app target `Info.plist` under `GADApplicationIdentifier`.

Initialize the Jolibox base SDK once during application startup, then initialize ads once after the base SDK is ready. The ads API, scene configuration, and host integration are documented in the host integration guide supplied with the SDK release.

## Release Integrity

Each package release uses immutable GitHub Release assets and SHA-256 checksums. Do not replace a published asset. Publish a new version for every SDK update.

For Chinese documentation, see [README_CN.md](README_CN.md).
