class Bridge {
  static postMessage(name, data = {}) {
    window.webkit?.messageHandlers?.nativeApp?.postMessage({name, ...data})
  }

  static get isTurboNativeApp() {
    return navigator.userAgent.indexOf("Turbo Native") !== -1
  }
}

window.TurboNativeBridge = Bridge
export default Bridge
