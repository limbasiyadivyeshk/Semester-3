const express = require('express');
const mongoose = require('mongoose');
const Faculty = require('./model/Faculty');
const bodyParser = require('body-parser')
const cors = require('cors');
mongoose.connect('mongodb+srv://Divyesh:8238@cluster0.k4eoqhi.mongodb.net/colleges?retryWrites=true&w=majority').then(()=>{
    const app = express();
    app.use(bodyParser.urlencoded({ extended: false }))
    app.use(cors());
    app.get('/Faculties',async (req,res)=>{
        const data = await Faculty.find();
        res.send(data);
    });

    app.get('/Faculties/:id',async (req,res)=>{
        const data = await Faculty.findOne({FacultyId:req.params.id});
        res.send(data);
    });

    app.post('/Faculties',async (req,res)=>{
        const fac = new Faculty();
        fac.FacultyId = req.body.FI;
        fac.FacultyName = req.body.FN;
        fac.FacultyAge = req.body.FA;
        const data = await fac.save();
        res.send(data);
    });

    app.put('/Faculties/:id',async (req,res)=>{
        const data = await Faculty.findOne({FacultyId:req.params.id});
        data.FacultyName = req.body.FN;
        data.FacultyAge = req.body.FA;

        await data.save();
        res.send(data);
    });

    app.delete('/Faculties/:id',async (req,res)=>{
        const data = await Faculty.deleteOne({FacultyId:req.params.id});
        res.send(data);
    });

    app.listen(3000,()=>{
        console.log("Server started at @ 3003");
    })
});


