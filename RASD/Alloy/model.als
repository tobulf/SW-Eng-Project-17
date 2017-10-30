/* Alloy model Travlendar+

		Tobias Rasmussen
		October 2017

*/


module travlendar
open util/boolean
// Starting with the basics

//Variables



sig integer{}
sig string{}
sig float{}


// Coordinates
sig coordinates{
latitude: one float,
longitude: one float
}

// Appointment
sig appointment{
owner: lone user,
currentlocation: lone coordinates,
location: lone coordinates, //only one location for each appointment
time:  lone float,// only one time
date: lone float, // only one date
name: lone string, // only one name
ETA: lone integer
}

//User
abstract sig user {
// each user has a Email and password
password: lone string,
email: lone string,

appointments: set appointment
}







// FACTS:
// There can only be one user with an specific email:
fact diffEmail{
	all disj u1,u2: user | u1. email != u2.email
}

// Appointments are not shared between users(maybe a later extension of SW):
fact NoSharedAppointments{
	no disj a1,a2: appointment | a1.owner = a2.owner
}

fact AppointmentProperties{
	//all coordinates must be associated with an appointment:
	all l:coordinates | some a:appointment | l in a.location or l in a.currentlocation 
	// All appointment are assigned to a user, and the user is the same as owner
	all a:appointment | all u: user | a in u.appointments and a.owner = u
} 


// Checks:
assert noUserIsEqual{
	// User may not have same email:
	all disj u1,u2: user | u1.email != u2.email
}
check noUserIsEqual

assert PrivateAppointments{
	all a:appoinment | a.owner = a.owner 

}









