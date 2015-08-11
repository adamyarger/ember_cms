import Ember from 'ember';

export default Ember.Controller.extend({
	actions: {
		saveChanges: function() {
			this.get('model').save();
		}
	}
});