import Quickshell
import QtQuick
import qs.modules.bar

ShellRoot {
   id: entrypoint

    Loader {
        sourceComponent: Bar {}
        active: true
    }
}
