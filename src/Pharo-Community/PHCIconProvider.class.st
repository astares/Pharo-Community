"
Utility class for providing icons - internally the icons are cached to preventing unnnecessary form (re)creation.
"
Class {
	#name : #PHCIconProvider,
	#superclass : #Object,
	#classVars : [
		'IconCache'
	],
	#category : #'Pharo-Community-Utilities'
}

{ #category : #icons }
PHCIconProvider class >> discordIcon [
	<script: 'self discordIcon inspect'>

	^self iconNamed: #discordIcon
]

{ #category : #'private - icons' }
PHCIconProvider class >> discordIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAACL0lEQVR4XnVTz2sTURgM7T/h
wUtVVCh48ZZbYW+So3oJ3jyItyJ4UaiXXW0rUapCxAa1LFZrQbAotGgREVcCGkipeGprsWnT
/ZmkJeVtHL95y9bG2oWB2W9mvn1v3/sy6dPT09ub8hP9hnHmrGVduGzbBDlr//N2FfqOZ7NX
bjjOmA08eAHcn0xAzho1erqapOR0Np+/OwGMPgasYqdz86FSZjGOCUs4a9TooberCbsWngK3
HgGTr9tq7mMbE69ilKYSkLNGjR5605XoZ3DIcQrSuVxpqJXVCMsrETbqAXzfhycgX/4ZgVq5
Eil6mdHhk6cMY7gEvHyz02k0PHiejzDwdHgvWKPWiDztZYbZTO6caY3KkioLoWpKA9f1EYmJ
xjRMHoWJRk+lGipmJGtm8pdsuzgF/Frz4iCQL4mx+r0lS91CIF8lyFmjRg+9zDCbOX/Rtqdn
Ad/bjPWeZZl3nvzG1QKwvhFokLNGLVnVZjw9BzCbGchZ1vwXyB7rKt3jp/I2Zj+0d7dAzhq1
5B/VFTMDOdnCoaOG8flrjO2teqdWC7AmaLVceXf1vyDIW01Xa7X1QHuZYVafxNCI46zWYt15
SY7r20ILiz+aWJLjJMhZI6eHXmZ278Hhvmz2ttyymfcK1cVQvZ3fwfUxYHg8wTXhrFGbeadA
LzP7rrIlt8ySgMlrW1JqZDyOCXLWqNGz7yqn5NjeYXoO3HuWgDwdpiP/DtPB42yaf8fZNA8a
5z+/DIHaPFfTgwAAAABJRU5ErkJggg=='
]

{ #category : #'private - utilities' }
PHCIconProvider class >> generateIcon [
	<script>
	
	| base64Contents fileName contentsMethod iconMethod iconName |  
	fileName := UIManager default fileOpen: 'Icon file' extensions: #('png').
	fileName ifNil: [ ^ self ].
	iconName := UIManager default request: 'Icon name' initialAnswer: 'blank'.
	iconName ifNil: [ ^ self ].
	base64Contents := (Base64MimeConverter mimeEncode: fileName binary) contents.
	fileName close.
	contentsMethod := String
		streamContents: [ :s | 
			s
				nextPutAll: iconName;
				nextPutAll: 'IconContents';
				cr;
				cr;
				tab;
				nextPut: $^;
				nextPut: $';
				nextPutAll: base64Contents;
				nextPut: $' ].
	iconMethod := String
		streamContents: [ :s | 
			s
				nextPutAll: iconName;
				nextPutAll: 'Icon';
				cr;
				tab;
				nextPutAll: '<script: ''self ';
				nextPutAll: iconName;
				nextPutAll: 'Icon';
				nextPutAll: ' inspect''>';
				cr;
				cr;
				tab;
				nextPutAll: '^self iconNamed: #';
				nextPutAll: iconName;
				nextPutAll: 'Icon' ].
	self class compile: contentsMethod classified: #'private - icons'.
	self class compile: iconMethod classified: #icons
]

{ #category : #icons }
PHCIconProvider class >> githubIcon [
	<script: 'self githubIcon inspect'>

	^self iconNamed: #githubIcon
]

{ #category : #'private - icons' }
PHCIconProvider class >> githubIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAAAlw
SFlzAAAAjQAAAI0Bxmb3pAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoA
AAEuSURBVDiNjdK/LkRREMfxj/0TRCKokWyhEIU/jbcQD8FjqIgKLSo9lYo3kC020VArECsh
IZFsbNYq7izHdW1MMrl35vy+JzNzht9Www4aeA5vRK5WoP+yMrbQQfcP74SmnIdLOO0D5v00
mC/biIMrbOMu4o/wLu6xieuIN3rwJNqR3I/cCOYwFD4XOTgMbRuTFayjkoDwFtX0LP0fjm8F
a1BPepvPD6fAFhJ9HZoRvPwDhgG8BtOEVgTvCp6nwMqh7aJVwmMcVP/Zwnxo4QFOfPd0hsE+
8CDOE/0xrEZwgBtcyqY7lYDTste69HOhVsg26kK2KMuywXQwmys7v40Xkm2cwROOMIqJXOnV
HPwUzA9bkq3wS7SSvkg5gW+xWDAfMI69uCi9oBTgLsZS4BNqymkiGV0zrgAAAABJRU5ErkJg
gg=='
]

{ #category : #'private - accessing' }
PHCIconProvider class >> iconCache [

	^ IconCache ifNil: [ IconCache := Dictionary new ]
]

{ #category : #accessing }
PHCIconProvider class >> iconNamed: aSymbol [
	"Returns the icon with the given name"
	
	| selector |
	selector := (aSymbol , 'Contents') asSymbol.
	(self class canUnderstand: selector) ifFalse: [ ^super iconNamed: aSymbol ].
	^ self iconCache
		at: aSymbol
		ifAbsentPut: [ 
			Form
				fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: (self perform: selector) readStream) ]
]

{ #category : #icons }
PHCIconProvider class >> mailIcon [
	<script: 'self mailIcon inspect'>

	^self iconNamed: #mailIcon
]

{ #category : #'private - icons' }
PHCIconProvider class >> mailIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA30lEQVR42q2TMRKCMBBFN52t
J5CSTo8gnZ2hszM34AjmCpxA7OwIJ4Ar0FniCbS0w+yEDC4JjjPxz2R+9d/+DYFBoNhfAKcD
71vtUnCQhfrZ1VUZANeAsii/zHnqU+mzJ84WYgSgz0Mu3jBZQepwKlIPBMNHAsFwfashiRN3
BQr5nGwgGO5fBbQNwGYnaAMrF0LD0CloIPM3oBDuDUPEaYMpwDZAt0LYbAOzgplmwuchVhkb
pqKzWLl3YBuM4YqEpo4Q5yustW9l5ryAZXeHR7RyPJf5+BK1+qB/IUTBgDd3sKUFeWiEyQAA
AABJRU5ErkJggg=='
]

{ #category : #icons }
PHCIconProvider class >> pharoDocumentIcon [
	<script: 'self pharoDocumentIcon inspect'>

	^self iconNamed: #pharoDocumentIcon
]

{ #category : #'private - icons' }
PHCIconProvider class >> pharoDocumentIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAA6klEQVR42mNkgIIDBw78ZyAC
ODg4MCLzGZENsLe3x6nx4MGDDCB5EI1sCMkGwNgwQ0gyAJtXiDYA3TD6GHDt2jWGO7dvMDi7
uDNwc3MTb8C/f/8Y/vz5w7BjxlSGf8cPMbjPW8bAyclJmgv+///PMDk2ieHXuUsMYVvXMEjL
yTEwMTExMDIyEu+FdctWMTCwMDP4BfkzsLCwkB4GE2YsZfjz4ztDXlYcAxsbG+kGHDt9jmHb
tdcMQUbyDEa6GqQZ8OXLV4bE2XsY4kykGXxsjMF+J8mAHz9+MLCysjIwMzPTMSERpRsKYAYA
AFC9oxEPJkNHAAAAAElFTkSuQmCC'
]

{ #category : #'initialize - release' }
PHCIconProvider class >> reset [
	"Reset the icon cache"	
	<script>
	
	IconCache := nil
]

{ #category : #icons }
PHCIconProvider class >> smalltalkHubIcon [
	<script: 'self smalltalkHubIcon inspect'>

	^self iconNamed: #smalltalkHubIcon
]

{ #category : #'private - icons' }
PHCIconProvider class >> smalltalkHubIconContents [

	^'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAADZklEQVR4XrWTXUzTVxjGDRo3
b9Dg4kecISaYOEfclJV0tkCRkH6IkzpACyngoKWFFgSqBWmFYlFAhKIxrLQUEBbmoEIcoZVO
NtKYgSPiNhC24bYouopLutRKxZb/4+l/Xiwuu9xJnouTnOd33vO8513xvywWI/JgXYVs8MvL
5/688UUTdc1S5W4oz3QIWDu1ISErQv5l2Lg+NDw/fV9zZ4Pil+FufcDRU4eR3iZ83WdAv0mD
9jo5LDU56G0uwGCLYrn7rHj+RHZCd2TEJjYNqMmNnWzTihZsJrXf3nkK10wn0VGvQHdjIQaM
agx3VsLWVga7qRT2T5W4cl7qL5NwPZkH9nhpQK009gfzCcGzoM7Kub5GVepzR9fpwDCBjXym
w40uLa62qAL64hRvhfKQP0e4G5KPP4CI/+4zGnAmL35ysLVsqbMyxdem5vvMKt6isZjvvVCS
5mmtUXhUkv3+o0IGDPpCjNh6UZ6fBFlaNES8yIW/n5DHufXo91nqe2d/4ObApUDf+bwlS3nS
okHOearL/8gjEuyCNDUa4047XH/MY8hqRoGICWH8jp9oQHVO7M1Hv92lrjZJA9NjQ8ujfc2B
+XvTy8ZjiV6NhO85mhyFokwOXK55PFlwwVAlRf6RaCTFbb9NA3QSzjcP5iZJSKrlmYmvqJ7q
FP/9uSnKXMpb1Eq5bklKFJQZH2L6zhgcA+3ouKiF/HA0BDERYzSgXBzz7a8z4xQJjJolgM/P
HA4EAcE8dDKeW5bKQGkWG3ZrKx7en0N14UHICCCRuc1JA0ozWM47Tit+vj2Cu7euU1dqjxDA
j1R7xQGfTs51K9OZUH8Sh9mpCVg76jHq6KcB8Yxt40F/SFEa09l3TowhYwFmJq5T39kt1IN7
U7isSX5RXcDzHhOzoMpmYajXiAXXQ+hK0pBL2sh+P5wGvMnYseX0JXXykrUhCzZjMQYMEoyS
n9ilEVJV0kQqCNCXCPGYhFivySYtZCKZs3Pp7Y1rK+kKiN4iiovZHW5rLOI+79GnoqtSCEtZ
Ek7l7iO3x6GlthAGXR4yBLt8Wzev6yHng9847J8jsZpoM1FCxJYwkyaL/Zf5OJ86LmZRivS9
ECa84w4LXdPwyriBaNV/DeOqVxXtXR+65iT7va2jb6xeqST7KKJ1rxtfAksazW0DCkCrAAAA
AElFTkSuQmCC'
]
