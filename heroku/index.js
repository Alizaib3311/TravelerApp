var express=require('express')
//var dotenv=require('dotenv')
var bodyParser=require('body-parser')
var cors=require('cors')
var routes=require('./routes/index')

var app=express()
//dotenv.config()



app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(cors());
app.use(cors({
  origin: true,
  credentials: true,
  methods: 'POST,GET,PUT,OPTIONS,DELETE' 
}));
app.use(function(req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
  })
app.use("/v1",routes)


app.listen("3000")
console.log("at 3000")