/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'warehouse',
    namespace: "api",
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    cookieKey: "_apiv4_key",
    host: "http://localhost:4000",
    socketNamespace: "ws://localhost:4000/socket",
    // host: 'https://cryptic-refuge-25793.herokuapp.com/',
    // socketNamespace: "wss://cryptic-refuge-25793.herokuapp.com/socket",
    "ember-simple-auth": {
      authenticationRoute: "index"
    },
    emblemOptions: {
      blueprints: false
    },
    stripe: {
      key: "pk_test_9VNs5lmJpCba3wXgHTbjTcCh",
      publishableKey: "pk_test_9VNs5lmJpCba3wXgHTbjTcCh"
    },
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },
    pace: {
      // addon-specific options to configure theme
      theme: 'loading-bar',
      color: 'blue',
      // pace-specific options
      // learn more on http://github.hubspot.com/pace/#configuration
      catchupTime: 50,
      initialRate: 0.01,
      minTime: 100,
      ghostTime: 50,
      maxProgressPerFrame: 20,
      easeFactor: 1.25,
      startOnPageLoad: true,
      restartOnPushState: true,
      restartOnRequestAfter: 500,
      target: 'body',
      elements: {
        checkInterval: 100,
        selectors: ['body', '.ember-view']
      },
      eventLag: {
        minSamples: 10,
        sampleCount: 3,
        lagThreshold: 3
      },
      ajax: {
        trackMethods: ['GET', 'POST', 'DELETE', 'OPTIONS'],
        trackWebSockets: true,
        ignoreURLs: []
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production' || environment === "staging") {
    ENV.locationType = 'hash';
    ENV.baseURL = '/warehouse/';
    ENV.host = 'https://cryptic-refuge-25793.herokuapp.com/';
    ENV.socketNamespace = "wss://cryptic-refuge-25793.herokuapp.com/socket";
  }

  return ENV;
};
