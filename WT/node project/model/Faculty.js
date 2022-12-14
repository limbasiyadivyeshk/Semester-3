const mongoose = require('mongoose');

const schema = mongoose.Schema({
    FacultyId: Number,
    FacultyName: String,
    FacultyAge: Number
});

module.exports = mongoose.model("Faculty",schema,"Faculties");