"
A community desktop
"
Class {
	#name : #PHCCommunityDesktop,
	#superclass : #Object,
	#category : 'Pharo-Community-Pages'
}

{ #category : #private }
PHCCommunityDesktop class >> mailingListsOn: aBuilder [		
	
	(aBuilder item: #'Mailinglists')
			order: 3; 
			parent: #'Community';
			label: 'Mailinglists';
			icon: PHCIconProvider mailIcon.
	aBuilder withSeparatorAfter.			
	(aBuilder item: #'Pharo-dev')
			order: 0.002; 
			parent: #'Mailinglists';
			label: 'Pharo-dev';
			icon: PHCIconProvider mailIcon;
			action: [ WebBrowser openOn: 'http://lists.pharo.org/mailman/listinfo/pharo-dev_lists.pharo.org' ].
	(aBuilder item: #'Pharo-users')
			order: 0.002; 
			parent: #'Mailinglists';
			label: 'Pharo-users';
			icon: PHCIconProvider mailIcon;
			action: [ WebBrowser openOn: 'http://lists.pharo.org/mailman/listinfo/pharo-users_lists.pharo.org' ].
	aBuilder withSeparatorAfter.
		
	(aBuilder item: #'pharo-bugtracker')
			order: 0.002; 
			parent: #'Mailinglists';
			label: 'pharo-bugtracker';
			icon: PHCIconProvider mailIcon;
			action: [ WebBrowser openOn: 'https://lists.gforge.inria.fr/pipermail/pharo-bugtracker' ].						
		
	aBuilder withSeparatorAfter.	
   (aBuilder item: #'VM-dev')
			order: 0.002; 
			parent: #'Mailinglists';
			label: 'VM-dev';
			icon: PHCIconProvider mailIcon;
			action: [ WebBrowser openOn: 'http://lists.squeakfoundation.org/mailman/listinfo/vm-dev' ].	
					
]

{ #category : #'world menu' }
PHCCommunityDesktop class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Community')
			order: 3.8; 			 
			label: 'Community';
			icon: PHCIconProvider pharoIcon.
	
	self pharoPagesOn: aBuilder.	
	
	(aBuilder item: #'Discord')
			order: 2; 
			parent: #'Community';
			label: 'Discord';
			icon: PHCIconProvider discordIcon;
			action: [ WebBrowser openOn: 'https://discordapp.com/channels/@me' ].
 
	
	self mailingListsOn: aBuilder.
		
	(aBuilder item: #'SmalltalkHub')
			order: 4; 
			parent: #'Community';
			label: 'SmalltalkHub';
			icon: PHCIconProvider smalltalkHubIcon;
			action: [ WebBrowser openOn: 'http://www.smalltalkhub.com' ].		
					
	(aBuilder item: #'GitHub')
			order: 5; 
			parent: #'Community';
			label: 'GitHub';
			icon: PHCIconProvider githubIcon;
			action: [ WebBrowser openOn: 'https://github.com/pharo-project/' ].								
]

{ #category : #private }
PHCCommunityDesktop class >> pharoPagesOn: aBuilder [


	(aBuilder item: #'Pharo pages')
			order: 1;
			parent: 'Community'; 			 
			label: 'Pharo';
			icon: PHCIconProvider pharoIcon.
	aBuilder withSeparatorAfter.			
			
	(aBuilder item: #'Pharo Homepage')
			order: 1; 
			parent: #'Pharo pages';
			label: 'Pharo Homepage';
			icon: PHCIconProvider pharoIcon;
			action: [ WebBrowser openOn: 'http://www.pharo.org' ].
	aBuilder withSeparatorAfter.	
		
	(aBuilder item: #'Pharo Books')
			order: 1; 
			parent: #'Pharo pages';
			label: 'Pharo Books';
			icon: PHCIconProvider pharoDocumentIcon;
			action: [ WebBrowser openOn: 'http://books.pharo.org' ].		
	aBuilder withSeparatorAfter.
	(aBuilder item: #'Pharo CI')
			order: 1; 
			parent: #'Pharo pages';
			label: 'Pharo CI Server';
			icon: PHCIconProvider pharoDocumentIcon;
			action: [ WebBrowser openOn: 'http://ci.pharo.org' ].
	(aBuilder item: #'Pharo CI (Pharo 7)')
			order: 1; 
			parent: #'Pharo pages';
			label: 'Pharo CI Server (Pharo 7)';
			icon: PHCIconProvider pharoDocumentIcon;
			action: [ WebBrowser openOn: 'https://ci.inria.fr/pharo-ci-jenkins2/job/Test%20pending%20pull%20request%20and%20branch%20Pipeline/job/development/' ].		
	aBuilder withSeparatorAfter.
		
	(aBuilder item: #'Pharo Association')
			order: 1; 
			parent: #'Pharo pages';
			label: 'Pharo Association';
			icon: PHCIconProvider pharoDocumentIcon;
			action: [ WebBrowser openOn: 'https://association.pharo.org' ].		
					
	(aBuilder item: #'Pharo Consortium')
			order: 1; 
			parent: #'Pharo pages';
			label: 'Pharo Consortium';
			icon: PHCIconProvider pharoDocumentIcon;
			action: [ WebBrowser openOn: 'http://consortium.pharo.org' ].					
			
]
