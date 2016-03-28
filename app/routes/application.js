import Ember from 'ember';
import ApplicationRouteMixin from 'ember-simple-auth/mixins/application-route-mixin';
import {Actions} from '../mixins/application-actions';
import {PaginationParamsCore} from 'autox/mixins/pagination-params';
export default Ember.Route.extend(ApplicationRouteMixin, {
  queryParams: PaginationParamsCore,
  actions: Actions
});