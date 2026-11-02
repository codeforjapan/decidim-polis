# frozen_string_literal: true

module Decidim
  module Polis
    # This is the engine that runs on the public interface of `polis`.
    # It mostly handles rendering the created projects associated to a participatory
    # process.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::Polis::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      # The component has no admin pages of its own: Decidim mounts this engine at the
      # component's manage path, and its root sends the admin to the component settings.
      routes do
        root to: redirect("../edit")
      end

      def load_seed
        nil
      end
    end
  end
end
