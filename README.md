# Portfolio plugin for Octopress and Jekyll

Add a portfolio section to your Octopress or Jekyll blog.
This project was forked from [vephinx](https://github.com/vephinx/Octopress-Portfolio-Plugin), which was forked from [anchetaWen](https://github.com/anchetaWern/portfolio-jekyll-plugin).


### The following modifications were made:

- Refactored main logic for generating main portfolio list page.
- Added an optional 'brief' description for each project to display on list page.
- Small changes to generated html, such as removing 'fancybox' class.

## How to Use

Copy `portfolio.rb` into your `/plugins` directory. 
Create a new folder in the `source` directory and name it `portfolio`.
This is where your projects will be stored. Each project will have its own folder, and inside the folder create the `index.markdown` file (the same as what's generated when you issue a `rake generate` command).
Also create an `index.markdown` file inside the `portfolio` directory. This file will contain the following text:

```
---
layout: page
title: "portfolio"
comments: false
sharing: true
footer: true
---

{% portfolio %}
```

What this does is to display the main image and the title for each of your projects. 
As you can see it uses the default `page` layout, if you want to use a different layout just create a new layout on the `_layouts` directory of the theme that you're using then just change the value for the layout attribute of your main portfolio page. 
So if you're using the default theme then the layouts directory is in `.themes/classic/source/_layouts`.

If you want to customize the CSS of the layout that you created, simply edit `scss` files inside the `sass/partials` directory
of the theme that you're using.

```
---
layout: page
title: "Project Item 1"
brief: "Optional brief description of project here."
date: 2013-02-23 07:21
comments: false
sharing: true
footer: true
---

Your content here.

{% portfolio Project Item 1 %}

Content after images.

```

Your folder structure should look like the following:

```
/plugins
	/portfolio.rb
/source
	/portfolio
		/index.markdown
		/Portfolio Item 1
			/index.markdown
			/main-image.jpg
			/small-image1.jpg
			/small-image2.jpg
		/portfolio Item 2
			/index.markdown
			/main-image.jpg
			/small-image1.jpg
			/small-image2.jpg		
```

The images for each portfolio item is stored in the same directory as the `index.markdown` file.

The image that you want to be the main image (the one that will be shown in the page where all the projects are displayed)
must have a prefix of `main-`. The additional images for that portfolio item should have a prefix of `small-`.


You can always customise the plugin based on the theme that you're using. You can change the HTML structure on the plugin file itself.

You also have to add the following config options to the `_config.yml` file:

```
# ----------------------- #
#   3rd Party Settings    #
# ----------------------- #

# Portfolio
portfolio_root: /portfolio
portfolio_path: /Volumes/Macintosh HD/Sebastian/Sites/octopress/source/portfolio

…
```

The `portfolio_root` is the name of the directory where your portfolio is saved.  
The `portfolio_path` is the actual path in your filesystem where your portfolio is saved.

You can use the plugin by using liquid tags with the name of the plugin as the first argument. The second argument is optional if you're rendering the main page of your portfolio. 

##License

The MIT License (MIT)
Copyright (c) <year> <copyright holders>
 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
