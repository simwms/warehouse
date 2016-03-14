import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';
import {Actions} from '../mixins/application-actions';
export default Ember.Route.extend(ApplicationRouteMixin, {
  actions: Actions
});