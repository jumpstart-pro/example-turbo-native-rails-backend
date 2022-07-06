class Bridge {
  static postMessage(name, data = {}) {
    // iOS
    window.webkit?.messageHandlers?.nativeApp?.postMessage({name, ...data})

    // Android
    window.nativeApp?.postMessage(JSON.stringify({name, ...data}))
  }

  static get isTurboNativeApp() {
    return navigator.userAgent.indexOf("Turbo Native") !== -1
  }
}

window.TurboNativeBridge = Bridge
export default Bridge
