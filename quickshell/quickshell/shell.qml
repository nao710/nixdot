import Quickshell
import QtQuick
// import "./modules/bar"
import qs.modules.bar

ShellRoot {
    id: entrypoint

    Loader {
        sourceComponent: Bar {}
        active: true
    }
}
