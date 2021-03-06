# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://docpad.github.com/githubpage-hoganjs.docpad/out/"

			# The default title of our website
			title: "Your GitHub Project"

			# Tagline beneath the title of our website
			tagline: """
				Credits to twitter's <a href="http://twitter.github.com/hogan.js/">hogan.js</a> for their open-source github page
				"""

			# Github project link
			githubUrl: 'https://github.com/docpad/githubpage-hoganjs.docpad'

			# The website description (for SEO)
			description: """
				When your website appears in search results in say Google, the text here will be shown underneath your website's title.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				place, your, website, keywoards, here, keep, them, related, to, the, content, of, your, website
				"""


		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

}


# Production Environment Settings
if process.env.PORT?
	# Do not check for newer docpad versions
	docpadConfig.checkVersion = false

	# Run the DocPad server on the production port
	docpadConfig.port = process.env.PORT

	# Set a maximum cache age of one day
	docpadConfig. maxAge = 86400000  # one day


# Export our DocPad Configuration
module.exports = docpadConfig