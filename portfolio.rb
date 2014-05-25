# Title: Portfolio Plugin for Jekyll
# Author: Eric Ren. Forked from Sebastian Ruiz http://sruiz.co.uk, original code by: Wern Ancheta http://anchetawern.github.com
# Description: Octopress portfolio plugin.
#

module Jekyll
  class Portfolio < Liquid::Tag

    def initialize(tag_name, id, tokens)
      super
      @project_folder = id.to_s.strip
    end

    def render(context)

      content = ""
      projects = []

      portfolio_root = context.registers[:site].config['portfolio_root']             # /portfolio
      portfolio_dir_path = context.registers[:site].config['portfolio_path']         # /Volumes/Macintosh HD/Sebastian/Sites/octopress/source/portfolio

      portfolio_dir = Dir.new portfolio_dir_path

      if(@project_folder == "")

        portfolio_dir.each do |project|
          if(project != "." && project != ".." && project != ".DS_Store" && project != "index.markdown")   # Added .DS_Store and index.markdown
            projects.push(project)

          end
        end

        projects.each do |project_name|
          Dir.foreach(portfolio_dir_path + "/" + project_name) do |filename|
            if(filename != "." && filename != ".." && filename != ".DS_Store")

              link = portfolio_root + "/" + project_name
              img = link + "/" + filename   #changed.

              title = File.basename(filename, File.extname(filename))

              if(filename.index "main")
                content += '<div class="portfolio-item cf ">'
                project_dir_path = portfolio_dir_path + "/" + project_name
                index_files = Dir.glob(project_dir_path + "/" + "index.*")
                if not index_files.empty?
                    # load the first index file found in directory, presumably in .markdown, although can be in other formats that is YAML compatible.

                    project_index_file = File.read(index_files[0])
                    project_yaml = YAML::load(project_index_file)
                    brief_desc = project_yaml['brief']
                    title_name = project_yaml['title'] #assume every file has a title in YAML front matter

                    if not brief_desc.nil?
                        content +=
                                    '<div class="portfolio-info ">' +
                                        '<a href="' + link + '">' +
                                            '<h3>'+ title_name + '</h3>' +
                                        '</a>' +
                                        '<p>'+ brief_desc + '</p>' +
                                    '</div>' +
                                    '<a title="' + title + '" href="' + link + '">' +
                                        '<img src="' + img + '">' +
                                    '</a>'
                    end
                else
                    content += '<a title="' + title + '" href="' + link + '"><h3>'+ title_name + '</h3><img src="' + img + '"></a>'
                end
                content += '</div>'
              end
            end
          end
        end
      else

        Dir.foreach(portfolio_dir_path + "/" + @project_folder) do |filename|
          if(filename != "." && filename != "..")

            link = portfolio_root + "/" + @project_folder
            img = link + "/" + filename   #changed.
            title = File.basename(filename, File.extname(filename))

            real_title = title.sub("small-", "")
            big_img = img.sub("small-", "")

            if(title.index "small-")
              content += '<a title="' + real_title + '" href="' + big_img + '" class="fancybox"><img src="' + img + '"></a>'
            end
            if(title.index "main-")
              content += '<a title="' + real_title + '" href="' + big_img + '" class="fancybox"><img src="' + img + '"></a>' # remove if you don't need main-* image on the portfolio page.
            end
          end
        end
      end
      return content
    end
  end
end

Liquid::Template.register_tag('portfolio', Jekyll::Portfolio)
