const express = require('express');
const router = express.Router();
const { adminAuthenticate } = require('../../middleware/adminAuth');

const categoriesRoutes = require('./categories');
const contentsRoutes = require('./contents');
const recipesRoutes = require('./recipes');
const uploadRoutes = require('./upload');
const authRoutes = require('./auth');

router.use('/auth', authRoutes);
router.use('/categories', adminAuthenticate, categoriesRoutes);
router.use('/contents', adminAuthenticate, contentsRoutes);
router.use('/recipes', adminAuthenticate, recipesRoutes);
router.use('/upload', adminAuthenticate, uploadRoutes);

module.exports = router;