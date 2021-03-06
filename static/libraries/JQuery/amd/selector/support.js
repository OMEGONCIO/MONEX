define(['../var/support', '../var/document'], function (support, document) { 'use strict';

// Support: IE 9 - 11+, Edge 12 - 18+
// IE/Edge don't support the :scope pseudo-class.
try {
	document.querySelectorAll( ":scope" );
	support.scope = true;
} catch ( e ) {}

return support;

});
