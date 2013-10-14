exports.about = function(req, res) {
    res.render('about', {
        title: 'About',
        id: 'about'
    });
};

exports.support = function(req, res) {
    res.render('support', {
        title: 'Support',
        id: 'support'
    });
};