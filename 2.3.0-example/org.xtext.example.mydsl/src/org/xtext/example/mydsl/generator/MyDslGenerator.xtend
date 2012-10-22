/*
 * generated by Xtext
 */
package org.xtext.example.mydsl.generator

import org.xtext.example.mydsl.myDsl.Model;

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IGenerator
import org.eclipse.xtext.generator.IFileSystemAccess

class MyDslGenerator implements IGenerator {
	
	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
        fsa.generateFile(resource.className+".txt", toTxtFile(resource.contents.head as Model))
	}
	
	def className(Resource res) {
        var name = res.URI.lastSegment
        return name.substring(0, name.indexOf('.'))
    }
	
	def toTxtFile(Model model) '''
This is an example of a generated file.

All greetings:
«FOR greeting : model.greetings»
«greeting.name»
«ENDFOR»
'''
	
}