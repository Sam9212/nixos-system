pragma Singleton

import Quickshell
import QtQuick

Singleton {
	id: constants
	property font font: Qt.font({
		family: 'JetBrains Mono NFM',
		pixelSize: 16,
		bold: false
	});

	property font labelFont: Qt.font({
		family: 'JetBrains Mono NFM',
		pixelSize: 18,
		bold: true
	});

	property font glyphFont: Qt.font({
		family: 'JetBrains Mono NFM',
		pixelSize: 32,
		bold: false
	});
}
