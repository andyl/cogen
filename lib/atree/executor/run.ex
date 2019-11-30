defmodule Atree.Executor.Run do

  @moduledoc """
  Runs Action commands and tests, Exports an Action guide.

  The `Export.guide` function traverses an Action tree and saves guide
  fragments into the `log` attribute of the `Atree.Data.Ctx`.

  To generate output, pipe the result into an `Atree.Presentor`:

      Atree.Executor.Export.guide(MyModule)
      |> Atree.Presentor.Markdown.to_stdout()
  """

  alias Atree.Executor.Util.Helpers
  alias Atree.Data.Log
  use Atree.Executor.Util.ExecTree

  def exec_log(mod, ctx, props) do
    report = Base.inspect(mod, ctx, props) 
    cx0 = report.ctx || ctx
    cx1 = Base.command(mod, cx0, props) 
    new_props = report.props || props

    guide = Helpers.gen_guide(report, mod, cx1, new_props)

    log = %Log{
      action: mod,
      test: Base.test(mod, cx1, props),
      guide: guide,
      children: []
    }

    cx2 = case log.test do
      {:error, _} -> halt(cx0)
      _ -> cx1
    end
    {cx2, log}
  end

end
