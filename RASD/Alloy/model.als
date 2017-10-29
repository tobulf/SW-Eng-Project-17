/* Alloy model Travlendar+

		Tobias Rasmussen
		October 2017

*/


module travlendar
open util/boolean
open util/ordering[Priority]
// Starting with the basics


//USERS:
// A User is a entity which has some attributes:
// We have an email and a password
sig email, password,appointment {
}

// a user can at most have one password:
sig user {
email: password -> lone email,
// A user can have zero or more appointments:
appointments: set appointment 
}


// DOMAIN ASSUMPTIONS Appointment creating and deleting/editing:
fun returnappointments [u: user] : set user {
u.appointments
} 

// A User can only delete appointments if he has appointments:


//A User may create appointments independant on whether
//he has an appointment or not:



//Delete a appointment:







//A User must 
