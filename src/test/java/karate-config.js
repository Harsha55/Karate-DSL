function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl : 'https://reqres.in/api/'
  }
  if (env == 'dev') {
    config.userEmail = 'karate0@test.com',
    config.userPassword = 'karatedsltest'
  }
  if (env == 'e2e') {
    // customize
  }

  // var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature',config).authToken;
  // karate.configure('headers',{Authorization : 'Token '+accessToken});
  return config;
}