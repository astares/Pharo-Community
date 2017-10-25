private
pharoPagesOn: aBuilder


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
			