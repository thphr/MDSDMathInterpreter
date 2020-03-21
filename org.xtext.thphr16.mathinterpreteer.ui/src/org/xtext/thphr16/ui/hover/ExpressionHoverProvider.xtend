package org.xtext.thphr16.ui.hover

import com.google.inject.Inject
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.Diagnostician
import org.eclipse.xtext.ui.editor.hover.html.DefaultEObjectHoverProvider

import static extension org.eclipse.emf.ecore.util.EcoreUtil.*
import org.xtext.thphr16.generator.MathinterpreteerGenerator
import org.xtext.thphr16.mathinterpreteer.Exp
import org.xtext.thphr16.mathinterpreteer.Div
import org.xtext.thphr16.mathinterpreteer.MathExp
import org.xtext.thphr16.mathinterpreteer.Mult
import org.xtext.thphr16.mathinterpreteer.Plus
import org.xtext.thphr16.mathinterpreteer.Minus
import org.xtext.thphr16.mathinterpreteer.Numb
import org.xtext.thphr16.mathinterpreteer.Parenthesis

class ExpressionHoverProvider extends DefaultEObjectHoverProvider {

	@Inject extension MathinterpreteerGenerator

	override getHoverInfoAsHtml(EObject o) {
		if (o instanceof Exp && o.programHasNoError) {
			val exp = o as Exp

			switch (exp) {
				MathExp: '''
					<p>
					«exp.display» = «exp.compute»
					</p>
				'''
				Div: '''
					<p>
					«exp.displayExp» = «exp.computeExp»
					</p>
				'''
				Mult: '''
					<p>
					«exp.displayExp» = «exp.computeExp»
					</p>
				'''
				Plus: '''
					<p>
					«exp.displayExp» = «exp.computeExp»
					</p>
				'''
				Minus: '''
					<p>
					«exp.displayExp» = «exp.computeExp»
					</p>
				'''
				Numb: '''
					<p>
					«exp.displayExp» = «exp.computeExp»
					</p>
				'''
				Parenthesis: {
					
				}
				default:
					super.getHoverInfoAsHtml(o)
			}

		}
	}

	def programHasNoError(EObject o) {
		Diagnostician.INSTANCE.validate(o.rootContainer).children.empty
	}

}
