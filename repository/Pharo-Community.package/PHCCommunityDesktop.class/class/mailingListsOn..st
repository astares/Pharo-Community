private
mailingListsOn: aBuilder		
	
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
   (aBuilder item: #'VM-dev')
			order: 0.002; 
			parent: #'Mailinglists';
			label: 'VM-dev';
			icon: PHCIconProvider mailIcon;
			action: [ WebBrowser openOn: 'http://lists.squeakfoundation.org/mailman/listinfo/vm-dev' ].	
					