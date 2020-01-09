import Foundation
import Gridicons

/**
 Displays the Media Editor with our custom styles and tracking
 */
class WPMediaEditor: MediaEditor {
    override var styles: MediaEditorStyles {
        get {
            return [
                .doneLabel: NSLocalizedString("Insert %@", comment: "Button title used in media editor. Placeholder will be the number of items that will be inserted."),
                .cancelLabel: NSLocalizedString("Cancel", comment: "Cancel editing an image"),
                .cancelColor: UIColor.white,
                .resetIcon: Gridicon.iconOfType(.undo),
                .doneIcon: Gridicon.iconOfType(.checkmark),
                .cancelIcon: Gridicon.iconOfType(.cross),
                .rotateClockwiseIcon: Gridicon.iconOfType(.rotate).withHorizontallyFlippedOrientation(),
                .rotateCounterclockwiseButtonHidden: true
            ]
        }

        set {
            // noop
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        WPAnalytics.track(.mediaEditorShown)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        trackUsage()
    }

    private func trackUsage() {
        guard !actions.isEmpty else {
            return
        }

        WPAnalytics.track(.mediaEditorUsed, withProperties: ["actions": actions.description])
    }
}
