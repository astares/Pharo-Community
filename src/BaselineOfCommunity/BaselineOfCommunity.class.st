"
Baseline of community
"
Class {
	#name : #BaselineOfCommunity,
	#superclass : #BaselineOf,
	#category : 'BaselineOfCommunity'
}

{ #category : #baseline }
BaselineOfCommunity >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.		
		spec package: #'Pharo-Community'.
		spec 
			group: 'all' with: #(#'Pharo-Community' );
			group: 'default' with: #('all' ). ].
]
