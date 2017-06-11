world menu
menuCommandOn: aBuilder
	<worldMenu>
	(aBuilder item: #'Community')
			order: 4; 			 
			label: 'Community';
			icon: PHCIconProvider pharoIcon.
	
	(aBuilder item: #'Discord')
			order: 0.002; 
			parent: #'Community';
			label: 'Discord';
			icon: PHCIconProvider discordIcon;
			action: [ WebBrowser openOn: 'https://discordapp.com/channels/@me' ].
	aBuilder withSeparatorAfter.
	
	(aBuilder item: #'Mailinglists')
			order: 0.002; 
			parent: #'Community';
			label: 'Mailinglists';
			icon: PHCIconProvider mailIcon.
			
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
   (aBuilder item: #'VM-dev')
			order: 0.002; 
			parent: #'Mailinglists';
			label: 'VM-dev';
			icon: PHCIconProvider mailIcon;
			action: [ WebBrowser openOn: 'http://lists.squeakfoundation.org/mailman/listinfo/vm-dev' ].					