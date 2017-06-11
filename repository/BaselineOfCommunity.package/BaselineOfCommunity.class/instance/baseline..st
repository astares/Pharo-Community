baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec project: 'WebBrowser' with: [
				spec
					className: #ConfigurationOfWebBrowser;
					versionString: #'stable';
					repository: 'http://smalltalkhub.com/mc/TorstenBergmann/WebBrowser/main/' ].
		spec package: #'Pharo-Community' with: [
				spec requires: #('WebBrowser' ). ].
		spec 
			group: 'all' with: #(#'Pharo-Community' );
			group: 'default' with: #('all' ). ].
