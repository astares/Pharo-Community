world menu
menuCommandOn: aBuilder
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