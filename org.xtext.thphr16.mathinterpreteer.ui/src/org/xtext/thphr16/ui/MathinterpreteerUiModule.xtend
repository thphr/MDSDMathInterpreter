/*
 * generated by Xtext 2.20.0
 */
package org.xtext.thphr16.ui

import org.xtext.thphr16.ui.hover.ExpressionHoverProvider
import org.eclipse.ui.plugin.AbstractUIPlugin
import org.eclipse.xtext.ui.editor.hover.IEObjectHoverProvider

/**
 * Use this class to register components to be used within the Eclipse IDE.
 */
class MathinterpreteerUiModule extends AbstractMathinterpreteerUiModule {
		new(AbstractUIPlugin plugin) {
		super(plugin);
	}
	
	def Class<? extends IEObjectHoverProvider> bindIEObjectHoverProvider() {
		return ExpressionHoverProvider
	}
}
