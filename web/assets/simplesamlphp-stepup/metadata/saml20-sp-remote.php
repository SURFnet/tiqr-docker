<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

$metadata['http://localhost:84/simplesaml-stepup/module.php/saml/sp/metadata.php/default-sp'] = [
    'AssertionConsumerService' => 'http://localhost:84/simplesaml-stepup/module.php/saml/sp/saml2-acs.php/default-sp',
    'SingleLogoutService'      => 'http://localhost:84/simplesaml-stepup/module.php/saml/sp/saml2-logout.php/default-sp',
];
