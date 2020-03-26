<?php
/**
 * SAML 2.0 remote IdP metadata for SimpleSAMLphp.
 *
 * Remember to remove the IdPs you don't use from this file.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-idp-remote 
 */
$metadata['http://localhost:84/simplesaml-stepup/module.php/saml/sp/metadata.php/default-sp'] = [
    'AssertionConsumerService' => 'http://localhost:84/simplesaml-stepup/module.php/saml/sp/saml2-acs.php/default-sp',
    'SingleLogoutService'      => 'http://localhost:84/simplesaml-stepup/module.php/saml/sp/saml2-logout.php/default-sp',
    'SingleSignOnService' =>
        array (
            0 =>
                array (
                    'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-Redirect',
                    'Location' => 'http://localhost:84/simplesaml-stepup/saml2/idp/SSOService.php',
                ),
            1 =>
                array (
                    'Binding' => 'urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST',
                    'Location' => 'http://localhost:84/simplesaml-stepup/saml2/idp/SSOService.php',
                ),
        ),
    // X.509 key and certificate. Relative to the cert directory.
    'privatekey' => 'certificate.pem',
    'certificate' => 'certificate.crt',
];

