import Ember from 'ember';
import config from './config/environment';

var Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.resource('leads', { path: '/' }, function() {
  	this.route('new');
    this.resource('lead', { path: '/leads/:lead_id' }, function() {
    	this.route('show');
    	this.route('edit');
    });
	});
});

export default Router;
